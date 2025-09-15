-- +goose Up
CREATE TABLE
    `users` (
        `id` integer PRIMARY KEY NOT NULL,
        `name` text NOT NULL,
        `email` text NOT NULL,
        `email_verified` integer NOT NULL,
        `image` text,
        `created_at` integer NOT NULL,
        `updated_at` integer NOT NULL
    );

CREATE UNIQUE INDEX `users_email_unique` ON `users` (`email`);

CREATE TABLE
    `accounts` (
        `id` integer PRIMARY KEY NOT NULL,
        `account_id` text NOT NULL,
        `provider_id` text NOT NULL,
        `user_id` integer NOT NULL,
        `access_token` text,
        `refresh_token` text,
        `id_token` text,
        `access_token_expires_at` integer,
        `refresh_token_expires_at` integer,
        `scope` text,
        `password` text,
        `created_at` integer NOT NULL,
        `updated_at` integer NOT NULL,
        FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE no action ON DELETE no action
    );

CREATE TABLE
    `sessions` (
        `id` integer PRIMARY KEY NOT NULL,
        `expires_at` integer NOT NULL,
        `token` text NOT NULL,
        `created_at` integer NOT NULL,
        `updated_at` integer NOT NULL,
        `ip_address` text,
        `user_agent` text,
        `user_id` integer NOT NULL,
        FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE no action ON DELETE no action
    );

CREATE UNIQUE INDEX `sessions_token_unique` ON `sessions` (`token`);

CREATE TABLE
    `verifications` (
        `id` integer PRIMARY KEY NOT NULL,
        `identifier` text NOT NULL,
        `value` text NOT NULL,
        `expires_at` integer NOT NULL,
        `created_at` integer,
        `updated_at` integer
    );

-- +goose Down
DROP TABLE IF EXISTS `verifications`;

DROP TABLE IF EXISTS `sessions`;

DROP TABLE IF EXISTS `accounts`;

DROP TABLE IF EXISTS `users`;
