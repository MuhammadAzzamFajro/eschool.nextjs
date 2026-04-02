import Redis from "ioredis";

let redis: Redis | null = null;

export function getRedisClient(): Redis {
    if (!redis) {
        const redisUrl = process.env.REDIS_URL || "redis://localhost:6379";
        redis = new Redis(redisUrl, {
            maxRetriesPerRequest: 3,
            retryStrategy(times) {
                const delay = Math.min(times * 50, 2000);
                return delay;
            },
            lazyConnect: true,
        });

        redis.on("error", (err) => {
            console.error("Redis connection error:", err);
        });

        redis.on("connect", () => {
            console.log("Redis connected successfully");
        });
    }

    return redis;
}

// Cache helpers
export async function getCache<T>(key: string): Promise<T | null> {
    try {
        const client = getRedisClient();
        const data = await client.get(key);
        return data ? JSON.parse(data) : null;
    } catch (error) {
        console.error("Redis get error:", error);
        return null;
    }
}

export async function setCache(
    key: string,
    value: unknown,
    ttlSeconds: number = 3600
): Promise<void> {
    try {
        const client = getRedisClient();
        await client.set(key, JSON.stringify(value), "EX", ttlSeconds);
    } catch (error) {
        console.error("Redis set error:", error);
    }
}

export async function deleteCache(key: string): Promise<void> {
    try {
        const client = getRedisClient();
        await client.del(key);
    } catch (error) {
        console.error("Redis delete error:", error);
    }
}

export async function deleteCachePattern(pattern: string): Promise<void> {
    try {
        const client = getRedisClient();
        const keys = await client.keys(pattern);
        if (keys.length > 0) {
            await client.del(...keys);
        }
    } catch (error) {
        console.error("Redis delete pattern error:", error);
    }
}
