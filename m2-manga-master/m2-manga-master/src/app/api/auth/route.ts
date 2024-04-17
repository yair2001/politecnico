import { customerPostDto } from "@/dto/customer.dto";
import { NextRequest, NextResponse } from "next/server";
import { encrypt } from "@/utils/encript.utils";
import prismaC from "@/utils/prisma.utils";

export async function POST(req: NextRequest, res: NextResponse) {
  try {
    //format
    const body: customerPostDto = await req.json();
    console.log(body)
    // Validations
    const userFind = await prismaC.customers.findUnique({
      where: {
        Email: body.email,
      },
    });

    if (userFind) {
      throw new Error("Usuario ya registrado");
    }
    //Insercion
    const password = encrypt(body.password);

    const userCreated = await prismaC.customers.create({
      data: {
        username: body.username,
        Email: body.email,
        Password: password,
      },
      select: {
        username:true,
        Email:true
      },
    });

    return Response.json({
      message: "Operacion completada de manera exitosa",
      body: { ...userCreated },
    });
  } catch (error) {
    console.log(error)
    return Response.json({
      message: "No se completo correctamente la creacion",
      error: error,
    },{status:400});
  }
}
