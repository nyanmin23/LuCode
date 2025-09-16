-- +goose Up
CREATE TABLE
    `user_ratings` (
        `id` integer PRIMARY KEY NOT NULL,
        `user_id` integer NOT NULL,
        `previous_rating` integer NOT NULL,
        `new_rating` integer NOT NULL,
        `rating_change` integer NOT NULL,
        `timestamp` integer NOT NULL,
        FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE no action ON DELETE no action
    )

-- +goose Down
DROP TABLE IF EXISTS `user_ratings`