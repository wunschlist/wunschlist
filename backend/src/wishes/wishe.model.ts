import { IsString, Length, IsUrl, IsNumber, Min } from 'class-validator';
import { Optional } from '@nestjs/common';

export class Wish {
    @IsString() @Length(3)
    title: string;

    @Optional() @IsString()
    description?: string;

    @Optional() @IsUrl()
    link?: string;

    @IsNumber() @Min(0)
    createdInMs: number;
}
