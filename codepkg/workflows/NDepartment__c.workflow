<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Email_To_Director</fullName>
        <description>Send Email To Director</description>
        <protected>false</protected>
        <recipients>
            <field>Office_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Department_To_Office</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Email_Department_Field</fullName>
        <field>Office_Director_Email__c</field>
        <formula>Office__r.Director__r.Email__c</formula>
        <name>Update Email Department Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>New Department Director Send Email</fullName>
        <actions>
            <name>Send_Email_To_Director</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Email_Department_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Sending e-mail to office director with adding new department to the office.</description>
        <formula>NOT(ISNULL(Office_Director_Email__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
