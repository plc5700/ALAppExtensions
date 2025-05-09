﻿// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Manufacturing.Setup;

using Microsoft.Finance.GeneralLedger.Setup;

tableextension 31256 "Manufacturing Setup CZA" extends "Manufacturing Setup"
{
    fields
    {
#if not CLEANSCHEMA29
        field(31060; "Default Gen.Bus.Post. Grp. CZA"; Code[20])
        {
            Caption = 'Default Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
            DataClassification = CustomerContent;
#if not CLEAN26
            ObsoleteState = Pending;
            ObsoleteTag = '26.0';
#else
            ObsoleteState = Removed;
            ObsoleteTag = '29.0';
#endif
            ObsoleteReason = 'Replaced by "Default Gen. Bus. Post. Group" field in Manufacturing Setup Name table.';
        }
#endif
        field(31068; "Exact Cost Rev.Mand. Cons. CZA"; Boolean)
        {
            Caption = 'Exact Cost Rev.Manda. (Cons.)';
            DataClassification = CustomerContent;
        }
    }
}
