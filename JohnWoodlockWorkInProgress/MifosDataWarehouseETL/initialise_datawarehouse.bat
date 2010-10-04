mysql -uroot -pmysql mifos_dwh < create_mifos_datawarehouse.sql
mysql -uroot -pmysql mifos_dwh < load_mifos_datawarehouse.sql
C:\Users\Keith\Desktop\PentahoPlatform\pdi-ce-4.0.0-stable\data-integration\kitchen.bat /file:C:\dev\businessIntelligenceRepo\bi\JohnWoodlockWorkInProgress\PractiseMifosDWETL\CreateDataWarehouse.kjb /level:Basic > transformationLog.log