#Virtual machine tests
title "Check azure virtual machines"

control 'azurerm_virtual_machine' do
    title "Test vm 2fawinserver settings"
    desc "Test few settings about 2fawinserver"
    describe azurerm_virtual_machine(resource_group: 'DuoSecurity', name: '2fawinserver') do
        it { should exist }
        its('location') { should eq('westeurope') }
        its('name') { should eq('2fawinserver') }
        its('type') { should eq 'Microsoft.Compute/virtualMachines' }
        its('properties.hardwareProfile.vmSize') { should eq 'Standard_DS1_v2'}
        its('properties.storageProfile.imageReference.offer') { should eq 'WindowsServer'}
        its('properties.storageProfile.imageReference.sku') { should eq '2019-Datacenter'}
        its('properties.storageProfile.imageReference.version') { should eq 'latest'}
    end
end
