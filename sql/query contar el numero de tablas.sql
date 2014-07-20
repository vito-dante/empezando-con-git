SELECT Count(*) FROM information_schema.tables
select count(*) from information_schema.tables where table_schema = 'information_schema';

SELECT tablename FROM pg_tables WHERE schemaname = 'public'
SELECT count(*) FROM pg_tables WHERE schemaname = 'public'
\i /path/to/yourfile.sql

SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='YOUR_DB_NAME_HERE'