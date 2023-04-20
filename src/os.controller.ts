import { Controller, Get } from '@nestjs/common';
import { OsService } from './os.service';

@Controller()
export class OsController {
  constructor(private readonly osService: OsService) {}

  @Get()
  getIndex(): string[] {
    return this.osService.getIndex();
  }
}
