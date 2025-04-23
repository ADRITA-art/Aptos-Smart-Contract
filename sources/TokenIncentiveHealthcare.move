module 0x412c6160333439b980c7ea6e4aa11b677ec79a33171047185c64895b8ad318e6::healthcare_token {
    use std::signer;
    use std::vector;
    use std::string::String;
    use aptos_framework::coin::{Self, Coin};
    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::account;
    
    // Error structs
    const E_NOT_ADMIN: u64 = 1;
    const E_INVALID_PARTICIPANT: u64 = 2;
    const E_INSUFFICIENT_REWARD: u64 = 3;
    
    // Resource structs
    struct HealthcareToken has key {
        admin: address,
        participants: vector<address>,
        // We'll store the balance as u64 instead of using CoinStore
        total_rewards: u64,
    }
    
    // Initialize the token system
    public entry fun initialize(admin: &signer) {
        let admin_addr = signer::address_of(admin);
        
        // Create the HealthcareToken resource
        move_to(admin, HealthcareToken {
            admin: admin_addr,
            participants: vector::empty<address>(),
            total_rewards: 0,
        });
    }
    
    // Add a participant
    public entry fun add_participant(admin: &signer, participant: address) acquires HealthcareToken {
        let admin_addr = signer::address_of(admin);
        let token = borrow_global_mut<HealthcareToken>(admin_addr);
        
        assert!(token.admin == admin_addr, E_NOT_ADMIN);
        vector::push_back(&mut token.participants, participant);
    }
    
    // Reward a participant
    public entry fun reward_participant(admin: &signer, participant: address, reward_amount: u64) acquires HealthcareToken {
        let admin_addr = signer::address_of(admin);
        let token = borrow_global<HealthcareToken>(admin_addr);
        
        assert!(token.admin == admin_addr, E_NOT_ADMIN);
        assert!(vector::contains(&token.participants, &participant), E_INVALID_PARTICIPANT);
        
        // Transfer APT coins directly
        coin::transfer<AptosCoin>(admin, participant, reward_amount);
    }
    
    // Check if an address is a participant
    public fun is_participant(admin_addr: address, participant: address): bool acquires HealthcareToken {
        let token = borrow_global<HealthcareToken>(admin_addr);
        vector::contains(&token.participants, &participant)
    }
}