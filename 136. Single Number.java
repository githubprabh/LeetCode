Runtime: 11 ms, faster than 32.45% of Java online submissions for Single Number.
Memory Usage: 50.4 MB, less than 65.97% of Java online submissions for Single Number.


class Solution {
    public int singleNumber(int[] nums) {
        Arrays.sort(nums);
        
        if(nums.length == 1)
            return nums[0];
        if(nums.length%2 == 0)
            return 0;
        if(nums[nums.length - 1] != nums[nums.length -2])
            return nums[nums.length -1];
        
        
        for(int i =0; i<nums.length -1; i = i+2){
            if(nums[i] != nums[i+1])
                return nums[i];
        }
        return 0;
}
}
