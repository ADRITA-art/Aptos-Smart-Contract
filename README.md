# 🗳️ SimpleVoting Module

This Move module implements a basic decentralized voting system on the Aptos blockchain. It enables users to create polls with multiple options and allows others to vote securely and transparently. Each voter can only vote once per poll.

---

## 📌 Features

1. **Create Poll**:
   - Users can initiate a voting poll by specifying multiple options.
   - Each poll is stored under the creator's account.

2. **Vote in Poll**:
   - Any Aptos account can vote for a specific option in an active poll.
   - Each account is allowed only **one vote per poll**.
   - The poll remains open until manually closed (extension idea) or can be handled off-chain.

---

## 🧱 Data Structures

### `VotingPoll`
The `VotingPoll` struct stores the following information:
- `creator`: Address of the poll creator.
- `options`: A list of voting options (stored as `vector<u8>` for UTF-8 strings).
- `votes`: A parallel vector of vote counts corresponding to each option.
- `voters`: A list of addresses that have already voted.
- `is_active`: A boolean flag indicating whether voting is still open.

---

## 🚫 Error Codes

- `E_ALREADY_VOTED (1)`: Raised when a user attempts to vote more than once in a single poll.
- `E_VOTING_CLOSED (2)`: Raised when a user attempts to vote in a poll that is no longer active.

---

## 🔧 Functions

### `create_poll`
- **Parameters**:
  - `creator`: The signer of the transaction (poll creator).
  - `options`: A vector of UTF-8 encoded voting options.
- **Description**: Initializes a new poll with zero votes for each option and activates it.

### `vote`
- **Parameters**:
  - `voter`: The signer of the transaction (voter).
  - `poll_creator`: The address of the poll's creator.
  - `option_index`: The index of the chosen option.
- **Description**: Allows a user to vote on an active poll, increments the vote count for the selected option, and records the voter's address to prevent double voting.

---

## 📜 Contract Details

### Contract Address
The screenshot of the transaction is given below:

![Screenshot 2025-04-22 210712](https://github.com/user-attachments/assets/9fd50b2e-ed3e-42f5-9681-7c7fcbee2463)



### Module Address
The module is deployed at the following address:
```
0x412c6160333439b980c7ea6e4aa11b677ec79a33171047185c64895b8ad318e6
```

### Dependencies
This module depends on the following Aptos framework modules:
- `aptos_framework::account` (currently unused)
- `aptos_framework::signer`
- `std::vector`

### Access Control
- Only the **creator** can create a poll.
- Any **unique address** can vote once per poll.
- Voting is restricted once the poll is marked inactive.

### State Management
- Each poll is stored on-chain under the creator’s account.
- The `VotingPoll` struct uses the `key` ability, allowing storage in global state.
- Voting history is stored on-chain via the `voters` vector.

---

## 📌 Usage Examples

1. **Create a Poll**:
   ```move
   create_poll(&signer, vector[vector[0x41], vector[0x42]]); // A, B
   ```

2. **Vote for Option 1**:
   ```move
   vote(&signer, poll_creator_address, 0); // votes for first option
   ```

---

## 💡 Notes

- Poll options are stored as byte vectors (`vector<u8>`) and should represent UTF-8 strings.
- The system does **not currently auto-close polls** after a deadline or maximum votes—consider adding it in future iterations.
- This module is minimalistic by design to serve as a base for more complex DAO or governance systems.

---

## 🔮 Future Scope

- ⏳ Add poll expiration or time-based closing
- 🥇 Winner detection and announcement
- 🔐 Zero-knowledge anonymous voting support
- 🧾 Voting events or logs for off-chain indexing
- 📲 Frontend integration with UI to display options and results

---

## ⚖️ License

This module is provided as-is under an open-source license. You are free to modify, extend, and use it in your own decentralized applications and governance tools.

---
