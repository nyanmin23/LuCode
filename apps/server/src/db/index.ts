import { createClient } from "@libsql/client/web";
import { env } from "cloudflare:workers";
import { Kysely, CamelCasePlugin } from "kysely";
import { LibsqlDialect } from "kysely-libsql";
import type { DB } from "kysely-codegen";

export const client = createClient({
  url: env.DATABASE_URL || "",
  authToken: env.DATABASE_AUTH_TOKEN,
});

export const getKysely = async () => {
  const dbClient = createClient({
    url: env.DATABASE_URL || "",
    authToken: env.DATABASE_AUTH_TOKEN,
  });

  const kysely = new Kysely<DB>({
    dialect: new LibsqlDialect({ client: dbClient, concurrency: 1 }),
    plugins: [new CamelCasePlugin()],
    log: ["query", "error"],
  });

  return kysely;
};
