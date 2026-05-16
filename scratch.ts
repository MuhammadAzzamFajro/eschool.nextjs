import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || "";
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || "";

const supabase = createClient(supabaseUrl, supabaseKey);

async function testLogin() {
    const { data, error } = await supabase.auth.signInWithPassword({
        email: "adminsmk8malang@gmail.com",
        password: "6Yg5fiqDqzbrzI54"
    });
    console.log("Data:", data);
    console.log("Error:", error);
}

testLogin();
