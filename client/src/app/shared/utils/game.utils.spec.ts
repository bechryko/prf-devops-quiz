import { Game } from '@prfq-shared/models';
import { GameUtils } from './game.utils';

describe('GameUtils', () => {
   const mockGame1 = {
      name: 'game1',
      quizzes: [
         {
            leaderboard: [
               { username: 'user1', score: 5 },
               { username: 'user2', score: 9 }
            ]
         },
         {
            leaderboard: [
               { username: 'user2', score: 10 },
               { username: 'user1', score: 2 },
               { username: 'user3', score: 0 }
            ]
         }
      ]
   } as Game;

   const mockGame2 = {
      name: 'game2',
      quizzes: [
         {
            leaderboard: [
               { username: 'user1', score: 3 },
               { username: 'user2', score: 1 },
               { username: 'user3', score: 8 },
               { username: 'user4', score: 0 }
            ]
         }
      ]
   } as Game;

   describe('getComputedLeaderboardEntries', () => {
      it('should sum the scores for users', () => {
         const entries = GameUtils.getComputedLeaderboardEntries(mockGame1);

         expect(entries).toContain({ username: 'user1', score: 7 });
         expect(entries).toContain({ username: 'user2', score: 19 });
         expect(entries).toContain({ username: 'user3', score: 0 });
      });
   });

   describe('compareGamesForSortingByPopularity', () => {
      it('should sort games by popularity', () => {
         const games = [mockGame1, mockGame2];

         const sorted = [...games].sort(GameUtils.compareGamesForSortingByPopularity.bind(GameUtils));

         expect(sorted[0].name).toEqual('game2');
         expect(sorted[1].name).toEqual('game1');
      });
   });
});
