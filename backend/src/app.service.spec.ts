import { Test } from '@nestjs/testing';
import { AppService } from './app.service';

describe('AppService', () => {
  let appService: AppService;

  beforeEach(async () => {
    const appModule = await Test.createTestingModule({
      providers: [AppService],
    }).compile();

    appService = appModule.get<AppService>(AppService);
  });

  describe('getHello', () => {
    it('should return the hello message', () => {
      const result = appService.getHello();
      expect(result).toEqual({ message: 'Hello World!' });
    });
  });
});
