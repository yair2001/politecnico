-- CreateEnum
CREATE TYPE "statusEnum" AS ENUM ('IN_STREAMING', 'CANCELED', 'FINISHED');

-- CreateTable
CREATE TABLE "role" (
    "id_role" SERIAL NOT NULL,
    "role_name" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "role_pkey" PRIMARY KEY ("id_role")
);

-- CreateTable
CREATE TABLE "content" (
    "id_content" SERIAL NOT NULL,
    "producer" TEXT,
    "name_content" TEXT NOT NULL,
    "alternative_name" TEXT,
    "descripcion_name" TEXT NOT NULL,
    "status" "statusEnum" NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "content_pkey" PRIMARY KEY ("id_content")
);

-- CreateTable
CREATE TABLE "owner" (
    "id_owner" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "role_id" INTEGER NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "owner_pkey" PRIMARY KEY ("id_owner")
);

-- CreateIndex
CREATE UNIQUE INDEX "role_role_name_key" ON "role"("role_name");

-- AddForeignKey
ALTER TABLE "owner" ADD CONSTRAINT "owner_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customers"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "owner" ADD CONSTRAINT "owner_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("id_role") ON DELETE RESTRICT ON UPDATE CASCADE;
