module 0x1::PaymentSplitter {
    use std::vector;
    use aptos_framework::coin;
    use aptos_framework::account;

    // Resource holding the list of recipients.
    struct Splitter has key {
        recipients: vector<address>
    }

    // Initializes the Payment Splitter with a list of recipient addresses.
    public fun initialize(account: &signer, addrs: vector<address>) {
        // Store the recipient list on-chain
        move_to(account, Splitter { recipients: addrs });
    }

    // Splits an incoming payment equally among the stored recipients.
    // The coin type T must satisfy the required traits.
    public fun split_payment<T: copy + drop + store>(sender: &signer, payment: coin::Coin<T>) {
        // Retrieve the stored list of recipients.
        let splitter = borrow_global<Splitter>(account::address_of(sender));
        let total = coin::value(&payment);
        let num = vector::length(&splitter.recipients);
        // Ensure there is at least one recipient.
        assert!(num > 0, 1);
        // Calculate the share for each recipient.
        let share = total / (num as u64);
        let mut i = 0;
        // Loop through each recipient.
        while (i < num) {
            let recipient = *vector::borrow(&splitter.recipients, i);
            if (i == num - 1) {
                // Last recipient receives the remaining coins.
                coin::deposit<T>(recipient, payment);
            } else {
                // Extract an equal share and deposit it.
                let part = coin::extract(payment, share);
                coin::deposit<T>(recipient, part);
            };
            i = i + 1;
        }
    }
}
