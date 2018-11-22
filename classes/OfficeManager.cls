public class OfficeManager {
 public static Office__c createOffice (String name){
        Office__c office = new Office__c (Name = name);
        DataBase.SaveResult sv = DataBase.insert(office);
        
        return office;
    }
    
    public static Boolean deleteOffice (Id officeId){
        try{
            delete new Office__c(Id = officeId);
        }catch (Exception ex){
            return false;
        }
      
        return true;
    }
    
    public static Office__c updateOffice(Id officeId, String name){
        Office__c office = new Office__c(
            Id = officeId,
                Name = name
          );

        
           return office;
    }
    
    public static Office__c getOfficeById (Id officeId){
        Office__c office = [select Name, Director__c from Office__c where id = :officeId];
        
        return office;
    }

}