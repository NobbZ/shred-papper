import { Test, TestingModule } from '@nestjs/testing';
import { OsController } from './os.controller';
import { OsService } from './os.service';

describe('OsController', () => {
  let osController: OsController;
  let osService: OsService;

  beforeEach(async () => {
    const app: TestingModule = await Test.createTestingModule({
      controllers: [OsController],
      providers: [OsService],
    }).compile();

    osService = app.get<OsService>(OsService);
    osController = app.get<OsController>(OsController);
  });

  describe('root', () => {
    it('should return a list of hosts', () => {
      const result = ['test'];
      jest.spyOn(osService, 'getIndex').mockImplementation(() => result);

      expect(osController.getIndex()).toStrictEqual(result);
    });
  });
});
