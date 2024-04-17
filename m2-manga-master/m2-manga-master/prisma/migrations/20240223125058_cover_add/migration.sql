/*
  Warnings:

  - Added the required column `cover_fk` to the `content` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type_content` to the `content` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "content" ADD COLUMN     "cover_fk" INTEGER NOT NULL,
ADD COLUMN     "type_content" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "cover" (
    "id_cover" SERIAL NOT NULL,
    "cover_url" TEXT NOT NULL,
    "banner_url" TEXT,

    CONSTRAINT "cover_pkey" PRIMARY KEY ("id_cover")
);

-- AddForeignKey
ALTER TABLE "content" ADD CONSTRAINT "content_cover_fk_fkey" FOREIGN KEY ("cover_fk") REFERENCES "cover"("id_cover") ON DELETE RESTRICT ON UPDATE CASCADE;
