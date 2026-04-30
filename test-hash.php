<?php
echo "Hash Admin: " . str_replace('$2y$', '$2a$', password_hash("6Yg5fiqDqzbrzI54", PASSWORD_BCRYPT)) . "\n";
echo "Hash Guru: " . str_replace('$2y$', '$2a$', password_hash("cV9AZvBeHTiHvp0f", PASSWORD_BCRYPT)) . "\n";
?>
