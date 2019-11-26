import { Controller, Get, Post, Body } from '@nestjs/common';
import { WishesService } from './wishes.service';
import { Wish } from './wishe.model';

@Controller()
export class WishesController {
  constructor(private readonly wishesService: WishesService) {}

  @Get('wishes')
  getWishes(): Wish[] {
    return this.wishesService.getWishes();
  }

  @Post('wishes')
  addWish(@Body() wish: Wish): void {
    this.wishesService.addWish(wish);
  }
}
