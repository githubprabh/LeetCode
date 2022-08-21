Runtime: 0 ms, faster than 100.00% of Java online submissions for Plus One.
Memory Usage: 42.2 MB, less than 71.91% of Java online submissions for Plus One.
    
    
class Solution {
    public int[] plusOne(int[] digits) {
        int[] d= new int[ digits.length + 1 ];
        
        for(int i=digits.length -1; i>-1; i--){
            if(digits[i] != 9){
                digits[i]++;
                break;
            }
            else{
                digits[i] = 0;
            }
        }
        if(digits[0] == 0){
            d[0] = 1;
            return d;
        }
        return digits;
    }
}
