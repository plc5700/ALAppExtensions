// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Finance.ReceivablesPayables;

tableextension 31050 "Invoice Posting Buffer CZL" extends "Invoice Posting Buffer"
{
    fields
    {
#if not CLEANSCHEMA27
        field(11773; "Ext. Amount CZL"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Ext. Amount';
            DataClassification = SystemMetadata;
            ObsoleteState = Removed;
            ObsoleteTag = '27.0';
            ObsoleteReason = 'The field is not used anymore.';
        }
        field(11774; "Ext. Amount Incl. VAT CZL"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Ext. Amount Including VAT';
            DataClassification = SystemMetadata;
            ObsoleteState = Removed;
            ObsoleteTag = '27.0';
            ObsoleteReason = 'The field is not used anymore.';
        }
#endif
        field(11780; "VAT Date CZL"; Date)
        {
            Caption = 'VAT Date';
            DataClassification = SystemMetadata;
        }
        field(11783; "Correction CZL"; Boolean)
        {
            Caption = 'Correction';
            DataClassification = SystemMetadata;
        }
        field(31112; "Original Doc. VAT Date CZL"; Date)
        {
            Caption = 'Original Document VAT Date';
            DataClassification = SystemMetadata;
        }
    }
}