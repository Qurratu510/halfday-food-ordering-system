<?php
include('../connection.php');

if (isset($_POST['order_id'], $_POST['new_status'])) {
    $order_id = (int) $_POST['order_id'];
    $new_status = mysqli_real_escape_string($condb, $_POST['new_status']);

    $valid_statuses = ['pending', 'preparing', 'ready', 'completed', 'cancelled'];
    
    // Optional: prevent "cancelled" if already "ready"
    $current_status_result = mysqli_query($condb, "SELECT status FROM cust_order WHERE order_id = $order_id");
    $current_status_row = mysqli_fetch_assoc($current_status_result);
    $current_status = $current_status_row['status'];

    if ($current_status === 'ready' && $new_status === 'cancelled') {
        // Redirect with error
        header('Location: staff_orders.php?error=1');
        exit;
    }

    if (in_array($new_status, $valid_statuses)) {
        $query = "UPDATE cust_order SET status = '$new_status' WHERE order_id = $order_id";
        mysqli_query($condb, $query);
    }
}

header('Location: staff_orders.php?success=1');
exit;
