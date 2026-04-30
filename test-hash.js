const bcrypt = require('bcryptjs');

const hash = "$2a$10$bswhV6GhqHci21OmgZTHD.tNZPzV21eG3EWnuoOqOrV2Hp3j.3VzS";
const hashY = "$2y$10$bswhV6GhqHci21OmgZTHD.tNZPzV21eG3EWnuoOqOrV2Hp3j.3VzS";
const pass1 = "6Yg5fiqDqzbrzI54";
const pass2 = "cV9AZvBeHTiHvp0f";

console.log("Admin pass match $2a$?:", bcrypt.compareSync(pass1, hash));
console.log("Admin pass match $2y$?:", bcrypt.compareSync(pass1, hashY));
