CREATE TABLE public.users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    age INTEGER NOT NULL,
    city TEXT NOT NULL
);

INSERT INTO public.users (name, email, age, city)
VALUES
    ('Ali', 'ali@gmail.com', 20, 'Lahore'),
    ('Ahmed', 'ahmed@gmail.com', 21, 'Islamabad'),
    ('Sara', 'sara@gmail.com', 22, 'Karachi'),
    ('Usman', 'usman@gmail.com', 20, 'Multan'),
    ('Waseem', 'waseem@gmail.com', 23, 'Bhakkar');

SELECT * FROM public.users;