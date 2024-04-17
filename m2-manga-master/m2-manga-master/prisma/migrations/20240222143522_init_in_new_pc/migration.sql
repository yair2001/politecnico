/*
  Warnings:

  - A unique constraint covering the columns `[name_content]` on the table `content` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterEnum
ALTER TYPE "statusEnum" ADD VALUE 'HIDDEN';

-- CreateIndex
CREATE UNIQUE INDEX "content_name_content_key" ON "content"("name_content");
