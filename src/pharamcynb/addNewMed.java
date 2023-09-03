/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pharamcynb;

import pharamcynb.AdminSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import pharamcynb.connectdb;

/**
 *
 * @author HP
 */
public class addNewMed extends javax.swing.JFrame {

    /**
     * Creates new form addNewMed
     */
    public addNewMed() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jFrame1 = new javax.swing.JFrame();
        lblAddMedHeader = new javax.swing.JLabel();
        lblMedName = new javax.swing.JLabel();
        txtMedName = new javax.swing.JTextField();
        lblQty = new javax.swing.JLabel();
        txtQty = new javax.swing.JTextField();
        lblPrice = new javax.swing.JLabel();
        txtPrice = new javax.swing.JTextField();
        btnAdd = new javax.swing.JButton();
        btnArrow = new javax.swing.JButton();
        lblImage = new javax.swing.JLabel();

        javax.swing.GroupLayout jFrame1Layout = new javax.swing.GroupLayout(jFrame1.getContentPane());
        jFrame1.getContentPane().setLayout(jFrame1Layout);
        jFrame1Layout.setHorizontalGroup(
            jFrame1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        jFrame1Layout.setVerticalGroup(
            jFrame1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        lblAddMedHeader.setFont(new java.awt.Font("Tahoma", 1, 36)); // NOI18N
        lblAddMedHeader.setText("Add Medication");
        getContentPane().add(lblAddMedHeader, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 10, 390, 40));

        lblMedName.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        lblMedName.setText("Medication Name");
        getContentPane().add(lblMedName, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 100, -1, 40));

        txtMedName.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        getContentPane().add(txtMedName, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 110, 230, 30));

        lblQty.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        lblQty.setText("Quantity");
        getContentPane().add(lblQty, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 180, -1, 40));

        txtQty.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        getContentPane().add(txtQty, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 190, 230, 30));

        lblPrice.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        lblPrice.setText("Price");
        getContentPane().add(lblPrice, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 270, -1, -1));

        txtPrice.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        getContentPane().add(txtPrice, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 270, 230, 30));

        btnAdd.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        btnAdd.setText("Add");
        btnAdd.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        btnAdd.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnAdd.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAddActionPerformed(evt);
            }
        });
        getContentPane().add(btnAdd, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 340, 60, 30));

        btnArrow.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/arrow.jpeg"))); // NOI18N
        btnArrow.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnArrow.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnArrowActionPerformed(evt);
            }
        });
        getContentPane().add(btnArrow, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, -1, 40));

        lblImage.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/admin_login_page.jpeg"))); // NOI18N
        getContentPane().add(lblImage, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 620, 400));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnAddActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAddActionPerformed
        int adminId = AdminSession.getAdminId();
        System.out.println(adminId);
        
        String medicationName = txtMedName.getText();
        int quantity = Integer.parseInt(txtQty.getText());
        int price = Integer.parseInt(txtPrice.getText());
        
        try{
            
            Connection conn;
            Statement st;
            PreparedStatement ps;
            ResultSet rs;
            conn = connectdb.createconnection();
            st = conn.createStatement();
            
            // Fetch pharmacy_id associated with the admin
        rs = st.executeQuery("SELECT pharma_id FROM pharma WHERE admin_id ='" + adminId + "'");
        int pharmacyId = -1;
        if (rs.next()) {
            pharmacyId = rs.getInt("pharma_id");
            System.out.println();
        }

        // Check if the medication name already exists in the medication table
        String checkMedQuery = "SELECT md_id FROM medication WHERE medName = ?";
        ps = conn.prepareStatement(checkMedQuery);
        ps.setString(1, medicationName);
        rs = ps.executeQuery();

        int existingMedId = -1;
        if (rs.next()) {
            existingMedId = rs.getInt("md_id");

            // Check if the same med_id and ph_id combination exists in the pharmamed table for each ph_id
            String checkPharmaMedQuery = "SELECT COUNT(*) AS count FROM pharmamed " +
                    "WHERE med_id= ? AND ph_id = ?"; // Exclude the current pharmacy
            ps = conn.prepareStatement(checkPharmaMedQuery);
            ps.setInt(1, existingMedId);
            ps.setInt(2, pharmacyId);
            rs = ps.executeQuery();

            if (rs.next() && rs.getInt("count") > 0) {
                System.out.println("Medication name already exists in the pharmamed table for other pharmacies.");
                return; // Exit the method, avoiding further insertion
            }
        }

        // If medication doesn't exist in the medication table, insert it
        if (existingMedId == -1) {
            String insertMedQuery = "INSERT INTO medication (medName) VALUES (?)";
            ps = conn.prepareStatement(insertMedQuery, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, medicationName);
            ps.executeUpdate();
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                existingMedId = generatedKeys.getInt(1);
            }
        }

        // Insert into pharmamed table
        String insertPharmaMedQuery = "INSERT INTO pharmamed (ph_id, med_id, quantity, price) " +
                "VALUES (?, ?, ?, ?)";
        ps = conn.prepareStatement(insertPharmaMedQuery);
        ps.setInt(1, pharmacyId);
        ps.setInt(2, existingMedId);
        ps.setInt(3, quantity);
        ps.setInt(4, price);
        ps.executeUpdate();
        System.out.println("Data inserted successfully into pharmamed.");

    } catch (Exception e) {
        e.printStackTrace();
    }
    }//GEN-LAST:event_btnAddActionPerformed

    private void btnArrowActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnArrowActionPerformed
        setVisible(false);
        new Home().setVisible(true);
    }//GEN-LAST:event_btnArrowActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(addNewMed.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(addNewMed.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(addNewMed.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(addNewMed.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new addNewMed().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAdd;
    private javax.swing.JButton btnArrow;
    private javax.swing.JFrame jFrame1;
    private javax.swing.JLabel lblAddMedHeader;
    private javax.swing.JLabel lblImage;
    private javax.swing.JLabel lblMedName;
    private javax.swing.JLabel lblPrice;
    private javax.swing.JLabel lblQty;
    private javax.swing.JTextField txtMedName;
    private javax.swing.JTextField txtPrice;
    private javax.swing.JTextField txtQty;
    // End of variables declaration//GEN-END:variables
}
