import { Module } from '@nestjs/common';
import { WishesService } from './wishes/wishes.service';
import { WishesController } from './wishes/wishes.controller';
import { AppController } from './app.controller';

@Module({
  imports: [],
  controllers: [
    WishesController,
    AppController,
  ],
  providers: [WishesService],
})
export class AppModule {}
