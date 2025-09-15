import { betterAuth, type BetterAuthOptions } from "better-auth";
import { drizzleAdapter } from "better-auth/adapters/drizzle";
import { client } from "../db";
import * as schema from "../db/schema/auth";
import { env } from "cloudflare:workers";
import { drizzle } from "drizzle-orm/libsql";

export const auth = betterAuth<BetterAuthOptions>({
  database: drizzleAdapter(drizzle({ client }), {
    provider: "sqlite",
    schema: schema,
    usePlural: true,
  }),
  trustedOrigins: [env.CORS_ORIGIN],
  emailAndPassword: {
    enabled: true,
  },
  secret: env.BETTER_AUTH_SECRET,
  baseURL: env.BETTER_AUTH_URL,
  advanced: {
    defaultCookieAttributes: {
      sameSite: "none",
      secure: true,
      httpOnly: true,
    },
  },
});
