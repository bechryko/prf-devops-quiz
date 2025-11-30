import { LeaderboardEntry } from '@prfq-shared/models';
import { SortLeaderboardEntriesPipe } from './sort-leaderboard-entries.pipe';

describe('SortLeaderboardEntriesPipe', () => {
   let pipe: SortLeaderboardEntriesPipe;

   beforeEach(() => {
      pipe = new SortLeaderboardEntriesPipe();
   });

   it('should sort leaderboard entries', () => {
      const entries: LeaderboardEntry[] = [
         {
            username: 'user1',
            score: 8
         },
         {
            username: 'user2',
            score: 1
         },
         {
            username: 'user3',
            score: 10
         }
      ];

      const sortedEntries = pipe.transform(entries);

      expect(sortedEntries[0].score).toBe(10);
      expect(sortedEntries[1].score).toBe(8);
      expect(sortedEntries[2].score).toBe(1);
   });
});
