import { Injectable } from '@nestjs/common';
import { Wish } from './wishe.model';

@Injectable()
export class WishesService {
    private wishesStorage: Wish[] = [];

    public getWishes(): Wish[] {
        return this.wishesStorage;
    }

    public addWish(wish: Wish): void {
        this.wishesStorage.push(wish);
    }
}
