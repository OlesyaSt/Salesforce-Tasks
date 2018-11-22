public class DepartmentManager {
    
    public static Department__c createDepartment (String name){
        Department__c department = new Department__c (Name = name);
        DataBase.SaveResult sv = DataBase.insert(department);
        
        return department;
    }
    
    public static Boolean deleteDepartment (Id departmentId){
        try{
            delete new Department__c(Id = departmentId);
        }catch (Exception ex){
            return false;
        }
      
        return true;
    }
    
    public static Department__c updateDepartment(Id departmentId, String name){
        Department__c department = new Department__c(
            Id = departmentId,
                Name = name
        );
       Database.SaveResult sv = Database.update(department);
        
       return department;
    }
    
    

}