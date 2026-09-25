-- Day 05: Supabase RLS and Relations

-- Create posts table
CREATE TABLE posts (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE posts ENABLE ROW LEVEL SECURITY;

-- SELECT Policy
CREATE POLICY "Allow users to view posts"
ON posts
FOR SELECT
USING (true);

-- INSERT Policy
CREATE POLICY "Allow users to insert posts"
ON posts
FOR INSERT
WITH CHECK (
    user_id IN (SELECT id FROM users)
);

-- UPDATE Policy
CREATE POLICY "Allow users to update posts"
ON posts
FOR UPDATE
USING (
    user_id IN (SELECT id FROM users)
)
WITH CHECK (
    user_id IN (SELECT id FROM users)
);

-- DELETE Policy
CREATE POLICY "Allow users to delete posts"
ON posts
FOR DELETE
USING (
    user_id IN (SELECT id FROM users)
);