const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  'https://eqmovbaueozuqwvqaanr.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVxbW92YmF1ZW96dXF3dnFhYW5yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzNTQ0MTYsImV4cCI6MjA5MDkzMDQxNn0.Jw53K6drSGJm8UcnWJjA8kyX5ZzfWfFZHDe8WhNWd2s'
);

async function testLogin() {
  const { data, error } = await supabase.auth.signInWithPassword({
    email: 'adminsmk8malang@gmail.com',
    password: '6Yg5fiqDqzbrzI54'
  });
  
  if (error) {
    console.error("Login Failed:", error.message);
  } else {
    console.log("Login Success! User ID:", data.user.id);
  }
}

testLogin();
