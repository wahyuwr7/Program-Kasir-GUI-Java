/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ProjectPBO;

import java.awt.event.KeyEvent;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/**
 *
 * @author RAMA
 */
public class Login extends javax.swing.JFrame {
    private String username = null, level = null, pegawai = null;
    
    private void Sesi() throws SQLException{
        System.out.println(level);
        if("3".equals(level)){
            new Kasir().setVisible(true);
        } else if("2".equals(level)){
            new Gudang().setVisible(true);
        } else if("1".equals(level)){
            new Admin().setVisible(true);
        }
        else{
            JOptionPane.showMessageDialog(null, "Ngga Jalan");
        }
    }
    public Login() {
        initComponents();
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        clGradientPanel1 = new ProjectPBO.ClGradientPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        txtusername = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        btnlogin = new javax.swing.JButton();
        btnkeluar = new javax.swing.JButton();
        txtps = new javax.swing.JPasswordField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Century Gothic", 1, 48)); // NOI18N
        jLabel1.setText("LOGIN");

        jLabel2.setFont(new java.awt.Font("Century Gothic", 0, 18)); // NOI18N
        jLabel2.setText("Username");

        txtusername.setFont(new java.awt.Font("Century Gothic", 0, 18)); // NOI18N
        txtusername.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtusernameActionPerformed(evt);
            }
        });

        jLabel3.setFont(new java.awt.Font("Century Gothic", 0, 18)); // NOI18N
        jLabel3.setText("Password");

        btnlogin.setText("LOGIN");
        btnlogin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnloginActionPerformed(evt);
            }
        });

        btnkeluar.setText("KELUAR");
        btnkeluar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnkeluarActionPerformed(evt);
            }
        });

        txtps.setFont(new java.awt.Font("Century Gothic", 1, 18)); // NOI18N
        txtps.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtpsActionPerformed(evt);
            }
        });
        txtps.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txtpsKeyPressed(evt);
            }
        });

        javax.swing.GroupLayout clGradientPanel1Layout = new javax.swing.GroupLayout(clGradientPanel1);
        clGradientPanel1.setLayout(clGradientPanel1Layout);
        clGradientPanel1Layout.setHorizontalGroup(
            clGradientPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(clGradientPanel1Layout.createSequentialGroup()
                .addGroup(clGradientPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(clGradientPanel1Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(txtps, javax.swing.GroupLayout.PREFERRED_SIZE, 226, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, clGradientPanel1Layout.createSequentialGroup()
                        .addGap(164, 164, 164)
                        .addGroup(clGradientPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, clGradientPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addGap(76, 76, 76))
                            .addComponent(txtusername, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 226, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, clGradientPanel1Layout.createSequentialGroup()
                                .addComponent(btnkeluar, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(btnlogin, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, clGradientPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel3)
                                .addGap(78, 78, 78))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, clGradientPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel1)
                                .addGap(41, 41, 41)))))
                .addContainerGap(183, Short.MAX_VALUE))
        );
        clGradientPanel1Layout.setVerticalGroup(
            clGradientPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(clGradientPanel1Layout.createSequentialGroup()
                .addGap(141, 141, 141)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 97, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(42, 42, 42)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtusername, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel3)
                .addGap(18, 18, 18)
                .addComponent(txtps, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(28, 28, 28)
                .addGroup(clGradientPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnlogin, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnkeluar, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(143, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(clGradientPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(clGradientPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnkeluarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnkeluarActionPerformed
        System.exit(0);
    }//GEN-LAST:event_btnkeluarActionPerformed

    private void btnloginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnloginActionPerformed
        String sql ="SELECT * FROM users WHERE user_name='"+txtusername.getText()+"' AND user_password = '"+txtps.getText()+"';";

        try{
            java.sql.Connection conn = (Connection)Config.configDB();
            java.sql.PreparedStatement pstm;
            pstm = conn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();

            while(rs.next()){
                username = rs.getString("user_id") ;
                level = rs.getString("user_level") ;
            }
            rs.last();
            if(rs.getRow()!= 0){
                Sesi.set_id(username);
                Sesi.set_Level(level);
                JOptionPane.showMessageDialog(null, "Login Success");
                Sesi();
                this.dispose();
            }
            else{
                JOptionPane.showMessageDialog(null, "Username atau password salah");
                txtusername.setText("");
                txtps.setText("");

            }
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Error");
            System.out.println(e);
            txtusername.setText("");
            txtps.setText("");
        }

        sql = "SELECT * FROM pegawai WHERE user_id = "+username+";";
        try{
            java.sql.Connection conn = (Connection)Config.configDB();
            java.sql.PreparedStatement pstm = conn.prepareStatement(sql);
            Statement stm = (Statement)conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                Sesi.set_pegawai_id(rs.getString(2));
            }

        }catch(Exception e){
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }//GEN-LAST:event_btnloginActionPerformed

    private void txtusernameActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtusernameActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtusernameActionPerformed

    private void txtpsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtpsActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtpsActionPerformed

    private void txtpsKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtpsKeyPressed
        // TODO add your handling code here:
        if(evt.getKeyCode()==KeyEvent.VK_ENTER){
            btnloginActionPerformed(null);
        }
    }//GEN-LAST:event_txtpsKeyPressed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        JPanel panel = new ClGradientPanel();
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Login().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnkeluar;
    private javax.swing.JButton btnlogin;
    private ProjectPBO.ClGradientPanel clGradientPanel1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPasswordField txtps;
    private javax.swing.JTextField txtusername;
    // End of variables declaration//GEN-END:variables

}
