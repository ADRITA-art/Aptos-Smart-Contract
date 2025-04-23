# 🏥 Healthcare Token Incentive System

This Move module implements a healthcare token incentive system on the Aptos blockchain. It enables healthcare administrators to add participants and reward them with tokens for various healthcare activities such as completing wellness programs, regular checkups, or maintaining healthy habits.

---

## 📌 Features

1. **Initialize System**:
   - Administrators can initialize the token system to manage participants and rewards.
   - The system is stored under the administrator's account.

2. **Manage Participants**:
   - Administrators can add participants to the incentive program.
   - Only approved participants can receive rewards.

3. **Reward Distribution**:
   - Administrators can send token rewards to participants.
   - Only registered participants are eligible to receive rewards.

---

## 🧱 Data Structures

### `HealthcareToken`
The `HealthcareToken` struct stores the following information:
- `admin`: Address of the system administrator.
- `participants`: A list of participant addresses eligible for rewards.
- `total_rewards`: Total rewards distributed through the system.

---

## 🚫 Error Codes

- `E_NOT_ADMIN (1)`: Raised when a non-administrator attempts to perform admin-only actions.
- `E_INVALID_PARTICIPANT (2)`: Raised when attempting to reward an unregistered participant.
- `E_INSUFFICIENT_REWARD (3)`: Raised when there are insufficient funds for a reward.

---

## 🔧 Functions

### `initialize`
- **Parameters**:
  - `admin`: The signer of the transaction (system administrator).
- **Description**: Initializes a new healthcare token system with the caller as the administrator.

### `add_participant`
- **Parameters**:
  - `admin`: The signer of the transaction (administrator).
  - `participant`: The address of the participant to add.
- **Description**: Allows the administrator to add a new participant to the incentive program.

### `reward_participant`
- **Parameters**:
  - `admin`: The signer of the transaction (administrator).
  - `participant`: The address of the participant to reward.
  - `reward_amount`: The amount of AptosCoin to transfer as a reward.
- **Description**: Transfers AptosCoin tokens from the administrator to a registered participant as a reward.

### `is_participant`
- **Parameters**:
  - `admin_addr`: The address of the administrator.
  - `participant`: The address to check.
- **Returns**: Boolean indicating whether the address is a registered participant.
- **Description**: Utility function to check if an address is registered in the system.

---

## 📜 Contract Details

### Contract Address
The screenshot of the transaction is given below:

![alt text](<Screenshot 2025-04-24 004640.png>)

### Module Address
The module is deployed at the following address:
```
0x412c6160333439b980c7ea6e4aa11b677ec79a33171047185c64895b8ad318e6
```
### Transaction Address
The transaction is at the following address:
```
0xd967596e59970aeeee0e70b87185a8794f7330ad26b3e61f89da430fc374a358
```
### Dependencies
This module depends on the following Aptos framework modules:
- `std::signer`
- `std::vector`
- `aptos_framework::coin`
- `aptos_framework::aptos_coin`

### Access Control
- Only the **administrator** can add participants and distribute rewards.
- Only **registered participants** can receive rewards.

### State Management
- The healthcare token system is stored on-chain under the administrator's account.
- The `HealthcareToken` struct uses the `key` ability, allowing storage in global state.
- Participant history is stored on-chain via the `participants` vector.

---

## 📌 Usage Examples

1. **Initialize the System**:
   ```move
   initialize(&admin_signer);
   ```

2. **Add a Participant**:
   ```move
   add_participant(&admin_signer, 0x123...); // Add participant with address 0x123...
   ```

3. **Reward a Participant**:
   ```move
   reward_participant(&admin_signer, 0x123..., 100); // Reward 100 AptosCoin
   ```

---

## 💡 Notes

- This system uses Aptos's native AptosCoin for rewards.
- The administrator must have sufficient AptosCoin to distribute rewards.
- This module is minimalistic by design to serve as a base for more complex healthcare incentive systems.

---

## 🔮 Future Scope

- ⏳ Add time-based reward tiers
- 🥇 Achievement badges or NFT rewards
- 🔐 Privacy-preserving health data integration
- 🧾 Activity tracking for fitness and wellness metrics
- 📲 Frontend integration with UI to display rewards and participant status

---

## ⚖️ License

This module is provided as-is under an open-source license. You are free to modify, extend, and use it in your own healthcare applications and incentive programs.

---
