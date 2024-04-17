-- CreateTable
CREATE TABLE "Customers" (
    "id_user" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "Password" TEXT NOT NULL,
    "Email" TEXT NOT NULL,

    CONSTRAINT "Customers_pkey" PRIMARY KEY ("id_user")
);

-- CreateIndex
CREATE UNIQUE INDEX "Customers_Email_key" ON "Customers"("Email");
