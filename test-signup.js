const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  'https://eqmovbaueozuqwvqaanr.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVxbW92YmF1ZW96dXF3dnFhYW5yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzNTQ0MTYsImV4cCI6MjA5MDkzMDQxNn0.Jw53K6drSGJm8UcnWJjA8kyX5ZzfWfFZHDe8WhNWd2s'
);

async function testSignup() {
  const { data, error } = await supabase.auth.signUp({
    email: 'adminsmk8malang@gmail.com',
    password: '6Yg5fiqDqzbrzI54',
    options: {
      data: {
        full_name: 'Admin SMK 8 Malang'
      }
    }
  });
  
  if (error) {
    console.error("SignUp Failed:", error.message);
  } else {
    console.log("SignUp Success! User ID:", data.user?.id);
  }
}

testSignup();
