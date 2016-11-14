using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyKhachSan
{
    public partial class frmDichVu : Form
    {
       public enum LuaChon
        {
            Them,
            Sua,
            Xoa
        }
        DatabaseDataContext db = new DatabaseDataContext();
        LuaChon lc;
        public frmDichVu()
        {
            InitializeComponent();
        }
        private void frmDichVu_Load(object sender, EventArgs e)
        {
            LoadDataDichVu();
        }
        private void LoadDataDichVu()
        {
            dgvDichVu.DataSource = db.tblDichVus.Select(n => n);
            dgvDichVu.Columns["IDDichVu"].HeaderText = "Mã Dịch Vụ";
            dgvDichVu.Columns["TenDichVu"].HeaderText = "Tên Dịch Vụ";
            dgvDichVu.Columns["GiaThanh"].HeaderText = "Giá Dịch Vụ";
            ChiDoc();
            HienButton();
        }
        void ChiDoc()
        {
            txtGiaThanh.ReadOnly = true;
            txtTenDichVu.ReadOnly = true;
            txtIDDichVu.ReadOnly = true;
        }
        void ChoViet()
        {
            txtGiaThanh.ReadOnly = false;
            txtTenDichVu.ReadOnly = false;
            txtIDDichVu.ReadOnly = false;
        }
        void AnButton()
        {
            btnHuy.Visible = true;
            btnLuu.Visible = true;
            btnThem.Visible = false;
            btnXoa.Visible = false;
            btnSua.Visible = false;
        }
        void HienButton()
        {
            btnThem.Visible = true;
            btnXoa.Visible = true;
            btnLuu.Visible = false;
            btnSua.Visible = true;
            btnHuy.Visible = false;
        }

        void ThemDichVu()
        {
            tblDichVu dd = new tblDichVu();
            if (dgvDichVu.Rows.Count < 1) dd.IDDichVu = 1;
            else dd.IDDichVu = db.tblPhongs.Select(n => n.IDPhong).Max() + 1;
            dd.TenDichVu = txtTenDichVu.Text;
            dd.GiaThanh = int.Parse(txtGiaThanh.Text);
            db.tblDichVus.InsertOnSubmit(dd);
            db.SubmitChanges();
        }
        void SuaDichVu()
        {
            tblDichVu dd = db.tblDichVus.Where(n => n.IDDichVu == int.Parse(txtIDDichVu.Text)).First();
            dd.TenDichVu = txtTenDichVu.Text;
            dd.GiaThanh = int.Parse(txtGiaThanh.Text);
            db.SubmitChanges();
        }
        void XoaDichVu()
        {
            tblDichVu dd = db.tblDichVus.Where(n => n.IDDichVu == int.Parse(txtIDDichVu.Text)).First();
            db.tblDichVus.DeleteOnSubmit(dd);
            db.SubmitChanges();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            dgvDichVu.Enabled = false;
            lc = LuaChon.Them;
            AnButton();
            ChoViet();
            txtIDDichVu.Clear();
            txtGiaThanh.Clear();
            txtTenDichVu.Clear();
            if (dgvDichVu.Rows.Count <= 1) txtIDDichVu.Text = "1";
            else txtIDDichVu.Text = (db.tblDichVus.Select(n => n.IDDichVu).Max() + 1).ToString();
            txtIDDichVu.ReadOnly = true;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (txtIDDichVu.Text == "") return;
            dgvDichVu.Enabled = false;
            lc = LuaChon.Sua;
            AnButton();
            ChoViet();
            txtIDDichVu.ReadOnly = true;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (txtIDDichVu.Text == "") return;
            lc = LuaChon.Xoa;
            AnButton();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            txtIDDichVu.Text = "";
            txtTenDichVu.Text = "";
            txtGiaThanh.Text = "";
            HienButton();
            dgvDichVu.Enabled = true;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if(txtTenDichVu.Text=="")
            {
                MessageBox.Show("Chưa nhập tên dịch vụ");
                return;
            }
            if(txtGiaThanh.Text=="")
            {
                MessageBox.Show("Chưa nhập giá dịch vụ");
                return;
            }
            switch (lc)
            {
                case LuaChon.Them:
                    ThemDichVu();
                    break;
                case LuaChon.Sua:
                    SuaDichVu();
                    break;
                case LuaChon.Xoa:
                    XoaDichVu();
                    break;
            }
            HienButton();
            LoadDataDichVu();
            dgvDichVu.Enabled = true;
            txtIDDichVu.Clear();
            txtGiaThanh.Clear();
            txtTenDichVu.Clear();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            try { dgvDichVu.DataSource = db.tblDichVus.Where(n => n.TenDichVu.Contains(txtTimKiem.Text)); }
            catch { LoadDataDichVu(); }
        }

        private void dgvDichVu_Click_1(object sender, EventArgs e)
        {
            DataGridViewRow row = dgvDichVu.SelectedRows[0];
            txtIDDichVu.Text = row.Cells["IDDichVu"].Value.ToString();
            txtGiaThanh.Text = row.Cells["TenDichVu"].Value.ToString();
            txtTenDichVu.Text = row.Cells["GiaThanh"].Value.ToString();
        }

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            txtTimKiem_TextChanged(sender, e);
        }

        
    }
}
