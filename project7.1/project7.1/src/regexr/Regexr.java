package regexr;

/**
 * Created by XPS 13 9350 on 2017/8/28.
 */
import java.util.regex.*;

public class Regexr {

    public Regexr(){

    }

    public boolean compare_reg(String pattern,String content){
        boolean isMatch = Pattern.matches(pattern,content);
        return isMatch;
    }

}
