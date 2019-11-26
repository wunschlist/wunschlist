import { Test, TestingModule } from '@nestjs/testing';
import { WishesController } from './wishes.controller';
import { WishesService } from './wishes.service';
import { Wish } from './wishe.model';

describe('WishesControllerController', () => {
  let wishesController: WishesController;

  beforeEach(async () => {
    const app: TestingModule = await Test.createTestingModule({
      controllers: [WishesController],
      providers: [WishesService],
    }).compile();

    wishesController = app.get<WishesController>(WishesController);
  });

  describe('/wishes', () => {
    it('should return an empty array', () => {
      expect(wishesController.getWishes()).toEqual([]);
    });

    it('should return a previously added wish', () => {
      const wish: Wish = {
        title: 'test',
        description: 'nope',
        createdInMs: 0,
        link: '',
      };
      wishesController.addWish(wish);
      expect(wishesController.getWishes()).toEqual([wish]);
    });
  });
});
