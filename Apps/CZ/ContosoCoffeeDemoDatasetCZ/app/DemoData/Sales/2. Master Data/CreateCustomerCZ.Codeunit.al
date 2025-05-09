// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace Microsoft.DemoData.Sales;

using Microsoft.Sales.Customer;
using Microsoft.DemoData.Finance;
using Microsoft.DemoData.Foundation;

codeunit 31293 "Create Customer CZ"
{
    SingleInstance = true;
    EventSubscriberInstance = Manual;
    InherentEntitlements = X;
    InherentPermissions = X;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnBeforeInsertCustomer(var Rec: Record Customer)
    var
        CreateCurrency: Codeunit "Create Currency";
        CreateCustomer: Codeunit "Create Customer";
        CreateLanguage: Codeunit "Create Language";
        CreatePaymentTerms: Codeunit "Create Payment Terms";
    begin
        case Rec."No." of
            CreateCustomer.DomesticAdatumCorporation():
                ValidateCustomer(Rec, CreateLanguage.CSY(), CreatePaymentTerms.PaymentTermsM8D(), '', '696 42', 'CZ789456278');
            CreateCustomer.DomesticTreyResearch():
                ValidateCustomer(Rec, CreateLanguage.CSY(), CreatePaymentTerms.PaymentTermsDAYS14(), '', '696 42', 'CZ733495789');
            CreateCustomer.ExportSchoolofArt():
                ValidateCustomer(Rec, CreateLanguage.ENU(), CreatePaymentTerms.PaymentTermsM8D(), CreateCurrency.USD(), 'FL 37125', '');
            CreateCustomer.EUAlpineSkiHouse():
                ValidateCustomer(Rec, CreateLanguage.DEU(), CreatePaymentTerms.PaymentTermsM8D(), CreateCurrency.EUR(), 'DE-80807', '582048936');
            CreateCustomer.DomesticRelecloud():
                ValidateCustomer(Rec, CreateLanguage.CSY(), CreatePaymentTerms.PaymentTermsCOD(), '', '669 02', '');
        end;
    end;

    local procedure ValidateCustomer(var Customer: Record Customer; LanguageCode: Code[10]; PaymentTermCode: Code[10]; CurrencyCode: Code[20]; PostCode: Code[20]; VatRegistraionNo: Text[20])
    begin
        Customer."Format Region" := '';
        Customer.Validate("Language Code", LanguageCode);
        Customer.Validate("Payment Terms Code", PaymentTermCode);
        Customer.Validate("Currency Code", CurrencyCode);
        Customer.Validate("Post Code", PostCode);
        Customer.Validate("VAT Registration No.", VatRegistraionNo);
    end;
}
