import { Test } from '@nestjs/testing';
import { AppController } from './app.controller';
import { AppService } from './app.service';

describe('AppController', () => {
  let appController: AppController;
  let appService: AppService;

  beforeEach(async () => {
    const appModule = await Test.createTestingModule({
      controllers: [AppController],
      providers: [AppService],
    }).compile();

    appController = appModule.get<AppController>(AppController);
    appService = appModule.get<AppService>(AppService);
  });

  describe('getHello', () => {
    it('should return the hello message', () => {
      const message = { message: 'Hello World!' };
      jest.spyOn(appService, 'getHello').mockReturnValue(message);

      const mockResponse = {
        json: jest.fn().mockReturnThis(),
      };

      appController.getHello(mockResponse);

      expect(mockResponse.json).toHaveBeenCalledWith(message);
    });
  });
});
