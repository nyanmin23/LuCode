import { PrismaLibSQL } from "@prisma/adapter-libsql";
import { PrismaClient } from "../../prisma/generated/client";

const adapter = new PrismaLibSQL({
	url: process.env.DATABASE_URL || "",
	authToken: process.env.DATABASE_AUTH_TOKEN,
});

const prisma = new PrismaClient({ adapter });

export default prisma;
