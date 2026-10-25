import { Controller, Post, UploadedFile, UseInterceptors, BadRequestException } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { InventarioService } from './service';

@Controller('api/inventario')
export class InventarioController {
  constructor(private readonly inventarioService: InventarioService) {}

  @Post('upload')
  @UseInterceptors(FileInterceptor('file'))
  async uploadInventario(@UploadedFile() file: Express.Multer.File) {
    if (!file) {
      throw new BadRequestException('No se ha adjuntado ningún archivo.');
    }

    return await this.inventarioService.procesarArchivoExcel(file);
  }
}
