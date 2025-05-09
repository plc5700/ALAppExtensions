// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace Microsoft.DemoData.FixedAsset;

using Microsoft.DemoTool.Helpers;

codeunit 5100 "Create FA Depreciation Book"
{
    InherentEntitlements = X;
    InherentPermissions = X;

    trigger OnRun()
    var
        FAModuleSetup: Record "FA Module Setup";
        ContosoFixedAsset: Codeunit "Contoso Fixed Asset";
    begin
        FAModuleSetup.Get();

        ContosoFixedAsset.InsertDepreciationBook(Company(), CompanyBookLbl, true, true, true, true, true, true, true, true, true, 0);

        if FAModuleSetup."Default Depreciation Book" = '' then
            FAModuleSetup.Validate("Default Depreciation Book", Company());

        FAModuleSetup.Modify();
    end;

    var
        CompanyLbl: Label 'COMPANY', MaxLength = 10;
        CompanyBookLbl: Label 'Company Book', MaxLength = 100;

    procedure Company(): Code[10]
    begin
        exit(CompanyLbl);
    end;
}
