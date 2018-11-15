<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_For_Manager</fullName>
        <description>Send  For Manager</description>
        <protected>false</protected>
        <recipients>
            <field>Email_Manager__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Employee_For_Manager</template>
    </alerts>
    <alerts>
        <fullName>The_end_soon</fullName>
        <description>The end soon</description>
        <protected>false</protected>
        <recipients>
            <field>Email_Manager__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/The_end_soon</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Department_Count</fullName>
        <field>Count_Employee_WorkFlow__c</field>
        <formula>IF(ISBLANK(Department__r.Count_Employee_WorkFlow__c), 1, Department__r.Count_Employee_WorkFlow__c+1)</formula>
        <name>Update Department Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Department__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Email_Field</fullName>
        <field>Email_Manager__c</field>
        <formula>Manager__r.Email__c</formula>
        <name>Update Email Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Calculate Count Employees</fullName>
        <actions>
            <name>Update_Department_Count</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>CreatedDate &lt;&gt; null</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New Employee For Manager Send Email</fullName>
        <actions>
            <name>Send_For_Manager</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Email_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>NOT(ISBLANK(Manager__r.Email__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>The_end_soon</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>NEmployee__c.Expiration_Date__c</offsetFromField>
            <timeLength>-10</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
