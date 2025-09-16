-- +goose Up
CREATE TABLE 
    `problems` (
        `id` integer PRIMARY KEY NOT NULL,
        `title` text NOT NULL,
        `statement` text NOT NULL,
        `time_limit_ms` integer NOT NULL,
        `memory_limit_kb` integer NOT NULL,
        `difficulty` integer NOT NULL,
        `author_id` integer NOT NULL,
        `is_public` integer NOT NULL,
        `created_at` integer NOT NULL,
        FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON UPDATE no action ON DELETE no action
    );

-- +goose Down
DROP TABLE IF EXISTS `problems`;