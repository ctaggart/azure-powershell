﻿# <auto-generated>
# Copyright (c) Microsoft and contributors.  All rights reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# 
# See the License for the specific language governing permissions and
# limitations under the License.
# 
# 
# Warning: This code was generated by a tool.
# 
# Changes to this file may cause incorrect behavior and will be lost if the
# code is regenerated.
# 
# For documentation on code generator please visit
#   https://aka.ms/nrp-code-generation
# Please contact wanrpdev@microsoft.com if you need to make changes to this file.
# </auto-generated>

function Check-CmdletReturnType
{
    param($cmdletName, $cmdletReturn)

    $cmdletData = Get-Command $cmdletName;
    Assert-NotNull $cmdletData;
    [array]$cmdletReturnTypes = $cmdletData.OutputType.Name | Foreach-Object { return ($_ -replace "Microsoft.Azure.Commands.Network.Models.","") };
    [array]$cmdletReturnTypes = $cmdletReturnTypes | Foreach-Object { return ($_ -replace "System.","") };
    $realReturnType = $cmdletReturn.GetType().Name -replace "Microsoft.Azure.Commands.Network.Models.","";
    return $cmdletReturnTypes -contains $realReturnType;
}

<#
.SYNOPSIS
Test creating new RouteTable using minimal set of parameters
#>
function Test-RouteTableCRUDMinimalParameters
{
    # Setup
    $rgname = Get-ResourceGroupName;
    $rglocation = Get-ProviderLocation ResourceManagement;
    $rname = Get-ResourceName;
    $location = Get-ProviderLocation "Microsoft.Network/RouteTables";
    # Dependency parameters
    $RouteName = "RouteName";
    $RouteAddressPrefix = "10.0.0.0/8";

    try
    {
        $resourceGroup = New-AzureRmResourceGroup -Name $rgname -Location $rglocation;

        # Create required dependencies
        $Route = New-AzureRmRouteConfig -Name $RouteName -AddressPrefix $RouteAddressPrefix;

        # Create RouteTable
        $vRouteTable = New-AzureRmRouteTable -ResourceGroupName $rgname -Name $rname -Location $location -Route $Route;
        Assert-NotNull $vRouteTable;
        Assert-True { Check-CmdletReturnType "New-AzureRmRouteTable" $vRouteTable };
        Assert-NotNull $vRouteTable.Routes;
        Assert-True { $vRouteTable.Routes.Length -gt 0 };
        Assert-AreEqual $rname $vRouteTable.Name;

        # Get RouteTable
        $vRouteTable = Get-AzureRmRouteTable -ResourceGroupName $rgname -Name $rname;
        Assert-NotNull $vRouteTable;
        Assert-True { Check-CmdletReturnType "Get-AzureRmRouteTable" $vRouteTable };
        Assert-AreEqual $rname $vRouteTable.Name;

        # Remove RouteTable
        $removeRouteTable = Remove-AzureRmRouteTable -ResourceGroupName $rgname -Name $rname -PassThru -Force;
        Assert-AreEqual $true $removeRouteTable;

        # Get RouteTable should fail
        Assert-ThrowsContains { Get-AzureRmRouteTable -ResourceGroupName $rgname -Name $rname } "${rname} not found";
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname;
    }
}

<#
.SYNOPSIS
Test creating new RouteTable
#>
function Test-RouteTableCRUDAllParameters
{
    # Setup
    $rgname = Get-ResourceGroupName;
    $rglocation = Get-ProviderLocation ResourceManagement;
    $rname = Get-ResourceName;
    $location = Get-ProviderLocation "Microsoft.Network/RouteTables";
    # Resource's parameters
    $Tag = @{tag1='test'};
    # Resource's parameters for Set test
    $TagSet = @{tag2='testSet'};
    # Dependency parameters
    $RouteName = "RouteName";
    $RouteAddressPrefix = "10.0.0.0/8";

    try
    {
        $resourceGroup = New-AzureRmResourceGroup -Name $rgname -Location $rglocation;

        # Create required dependencies
        $Route = New-AzureRmRouteConfig -Name $RouteName -AddressPrefix $RouteAddressPrefix;

        # Create RouteTable
        $vRouteTable = New-AzureRmRouteTable -ResourceGroupName $rgname -Name $rname -Location $location -Route $Route -Tag $Tag;
        Assert-NotNull $vRouteTable;
        Assert-True { Check-CmdletReturnType "New-AzureRmRouteTable" $vRouteTable };
        Assert-NotNull $vRouteTable.Routes;
        Assert-True { $vRouteTable.Routes.Length -gt 0 };
        Assert-AreEqual $rname $vRouteTable.Name;
        Assert-AreEqualObjectProperties $Tag $vRouteTable.Tag;

        # Get RouteTable
        $vRouteTable = Get-AzureRmRouteTable -ResourceGroupName $rgname -Name $rname;
        Assert-NotNull $vRouteTable;
        Assert-True { Check-CmdletReturnType "Get-AzureRmRouteTable" $vRouteTable };
        Assert-AreEqual $rname $vRouteTable.Name;
        Assert-AreEqualObjectProperties $Tag $vRouteTable.Tag;

        # Set RouteTable
        $vRouteTable.Tag = $TagSet;
        $vRouteTable = Set-AzureRmRouteTable -RouteTable $vRouteTable;
        Assert-NotNull $vRouteTable;
        Assert-True { Check-CmdletReturnType "Set-AzureRmRouteTable" $vRouteTable };
        Assert-AreEqual $rname $vRouteTable.Name;
        Assert-AreEqualObjectProperties $TagSet $vRouteTable.Tag;

        # Get RouteTable
        $vRouteTable = Get-AzureRmRouteTable -ResourceGroupName $rgname -Name $rname;
        Assert-NotNull $vRouteTable;
        Assert-True { Check-CmdletReturnType "Get-AzureRmRouteTable" $vRouteTable };
        Assert-AreEqual $rname $vRouteTable.Name;
        Assert-AreEqualObjectProperties $TagSet $vRouteTable.Tag;

        # Remove RouteTable
        $removeRouteTable = Remove-AzureRmRouteTable -ResourceGroupName $rgname -Name $rname -PassThru -Force;
        Assert-AreEqual $true $removeRouteTable;

        # Get RouteTable should fail
        Assert-ThrowsContains { Get-AzureRmRouteTable -ResourceGroupName $rgname -Name $rname } "${rname} not found";
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname;
    }
}

<#
.SYNOPSIS
Test creating new Route using minimal set of parameters
#>
function Test-RouteCRUDMinimalParameters
{
    # Setup
    $rgname = Get-ResourceGroupName;
    $rglocation = Get-ProviderLocation ResourceManagement;
    $rname = Get-ResourceName;
    $rnameAdd = "${rname}Add";
    $location = Get-ProviderLocation "Microsoft.Network/RouteTables";
    # Resource's parameters
    $AddressPrefix = "10.0.0.0/8";
    # Resource's parameters for Set test
    $AddressPrefixSet = "11.0.0.0/8";
    # Resource's parameters for Add test
    $AddressPrefixAdd = "12.0.0.0/8";

    try
    {
        $resourceGroup = New-AzureRmResourceGroup -Name $rgname -Location $rglocation;

        # Create Route
        $vRoute = New-AzureRmRouteConfig -Name $rname -AddressPrefix $AddressPrefix;
        Assert-NotNull $vRoute;
        Assert-True { Check-CmdletReturnType "New-AzureRmRouteConfig" $vRoute };
        $vRouteTable = New-AzureRmRouteTable -ResourceGroupName $rgname -Name $rname -Route $vRoute -Location $location;
        Assert-NotNull $vRouteTable;
        Assert-AreEqual $rname $vRoute.Name;
        Assert-AreEqual $AddressPrefix $vRoute.AddressPrefix;

        # Get Route
        $vRoute = Get-AzureRmRouteConfig -RouteTable $vRouteTable -Name $rname;
        Assert-NotNull $vRoute;
        Assert-True { Check-CmdletReturnType "Get-AzureRmRouteConfig" $vRoute };
        Assert-AreEqual $rname $vRoute.Name;
        Assert-AreEqual $AddressPrefix $vRoute.AddressPrefix;

        # Set Route
        $vRouteTable = Set-AzureRmRouteConfig -Name $rname -RouteTable $vRouteTable -AddressPrefix $AddressPrefixSet;
        Assert-NotNull $vRouteTable;
        $vRouteTable = Set-AzureRmRouteTable -RouteTable $vRouteTable;

        # Get Route
        $vRoute = Get-AzureRmRouteConfig -RouteTable $vRouteTable -Name $rname;
        Assert-NotNull $vRoute;
        Assert-True { Check-CmdletReturnType "Get-AzureRmRouteConfig" $vRoute };
        Assert-AreEqual $rname $vRoute.Name;
        Assert-AreEqual $AddressPrefixSet $vRoute.AddressPrefix;

        # Add Route
        $vRouteTable = Add-AzureRmRouteConfig -Name $rnameAdd -RouteTable $vRouteTable -AddressPrefix $AddressPrefixAdd;
        Assert-NotNull $vRouteTable;
        $vRouteTable = Set-AzureRmRouteTable -RouteTable $vRouteTable;

        # Get Route
        $vRoute = Get-AzureRmRouteConfig -RouteTable $vRouteTable -Name $rnameAdd;
        Assert-NotNull $vRoute;
        Assert-True { Check-CmdletReturnType "Get-AzureRmRouteConfig" $vRoute };
        Assert-AreEqual $rnameAdd $vRoute.Name;
        Assert-AreEqual $AddressPrefixAdd $vRoute.AddressPrefix;

        # Remove Route
        Remove-AzureRmRouteConfig -RouteTable $vRouteTable -Name $rnameAdd;
        $vRouteTable = Set-AzureRmRouteTable -RouteTable $vRouteTable;

        # Get Route should fail
        Assert-ThrowsContains { Get-AzureRmRouteConfig -RouteTable $vRouteTable -Name $rnameAdd } "Sequence contains no matching element";
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname;
    }
}

<#
.SYNOPSIS
Test creating new Route
#>
function Test-RouteCRUDAllParameters
{
    # Setup
    $rgname = Get-ResourceGroupName;
    $rglocation = Get-ProviderLocation ResourceManagement;
    $rname = Get-ResourceName;
    $rnameAdd = "${rname}Add";
    $location = Get-ProviderLocation "Microsoft.Network/RouteTables";
    # Resource's parameters
    $AddressPrefix = "10.0.0.0/8";
    $NextHopType = "VirtualNetworkGateway";
    # Resource's parameters for Set test
    $AddressPrefixSet = "11.0.0.0/8";
    $NextHopTypeSet = "VnetLocal";
    # Resource's parameters for Add test
    $AddressPrefixAdd = "12.0.0.0/8";
    $NextHopTypeAdd = "VnetLocal";

    try
    {
        $resourceGroup = New-AzureRmResourceGroup -Name $rgname -Location $rglocation;

        # Create Route
        $vRoute = New-AzureRmRouteConfig -Name $rname -AddressPrefix $AddressPrefix -NextHopType $NextHopType;
        Assert-NotNull $vRoute;
        Assert-True { Check-CmdletReturnType "New-AzureRmRouteConfig" $vRoute };
        $vRouteTable = New-AzureRmRouteTable -ResourceGroupName $rgname -Name $rname -Route $vRoute -Location $location;
        Assert-NotNull $vRouteTable;
        Assert-AreEqual $rname $vRoute.Name;
        Assert-AreEqual $AddressPrefix $vRoute.AddressPrefix;
        Assert-AreEqual $NextHopType $vRoute.NextHopType;

        # Get Route
        $vRoute = Get-AzureRmRouteConfig -RouteTable $vRouteTable -Name $rname;
        Assert-NotNull $vRoute;
        Assert-True { Check-CmdletReturnType "Get-AzureRmRouteConfig" $vRoute };
        Assert-AreEqual $rname $vRoute.Name;
        Assert-AreEqual $AddressPrefix $vRoute.AddressPrefix;
        Assert-AreEqual $NextHopType $vRoute.NextHopType;

        # Set Route
        $vRouteTable = Set-AzureRmRouteConfig -Name $rname -RouteTable $vRouteTable -AddressPrefix $AddressPrefixSet -NextHopType $NextHopTypeSet;
        Assert-NotNull $vRouteTable;
        $vRouteTable = Set-AzureRmRouteTable -RouteTable $vRouteTable;

        # Get Route
        $vRoute = Get-AzureRmRouteConfig -RouteTable $vRouteTable -Name $rname;
        Assert-NotNull $vRoute;
        Assert-True { Check-CmdletReturnType "Get-AzureRmRouteConfig" $vRoute };
        Assert-AreEqual $rname $vRoute.Name;
        Assert-AreEqual $AddressPrefixSet $vRoute.AddressPrefix;
        Assert-AreEqual $NextHopTypeSet $vRoute.NextHopType;

        # Add Route
        $vRouteTable = Add-AzureRmRouteConfig -Name $rnameAdd -RouteTable $vRouteTable -AddressPrefix $AddressPrefixAdd -NextHopType $NextHopTypeAdd;
        Assert-NotNull $vRouteTable;
        $vRouteTable = Set-AzureRmRouteTable -RouteTable $vRouteTable;

        # Get Route
        $vRoute = Get-AzureRmRouteConfig -RouteTable $vRouteTable -Name $rnameAdd;
        Assert-NotNull $vRoute;
        Assert-True { Check-CmdletReturnType "Get-AzureRmRouteConfig" $vRoute };
        Assert-AreEqual $rnameAdd $vRoute.Name;
        Assert-AreEqual $AddressPrefixAdd $vRoute.AddressPrefix;
        Assert-AreEqual $NextHopTypeAdd $vRoute.NextHopType;

        # Remove Route
        Remove-AzureRmRouteConfig -RouteTable $vRouteTable -Name $rnameAdd;
        $vRouteTable = Set-AzureRmRouteTable -RouteTable $vRouteTable;

        # Get Route should fail
        Assert-ThrowsContains { Get-AzureRmRouteConfig -RouteTable $vRouteTable -Name $rnameAdd } "Sequence contains no matching element";
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname;
    }
}
