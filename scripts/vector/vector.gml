Vector2 = 
{
	x:0,
	y:0,
	type:0,
	GetAngle : function(){},
	GetLength : function(){},
}

/// @function 			Vector2(_x,_y);
/// @param	{real}	_x	The x coordinate of the vector
///	@param	{real}	_y	The y coordinate of the vector
function Vector2(_x, _y) constructor
{
	x=_x;
	y=_y;
	type = "vector2";
	
	GetAngle = function()
	{
		if(x == 0){
			return y > 0 ? 90 : (y == 0 ? 0 : 270);
		}
		else if (y == 0){
			return (x >= 0)
			? 0
			: 180;
		}
		var ret = darctan(y/x);
		if(x < 0 && y < 0){
			ret = 180 + ret;
		}
		else if(x < 0){
			ret = 180 + ret;
		}
		else if (y < 0){
			ret = 270 + (90 + ret);
		}
		
		return ret;
		//var len = sqrt(self.x*self.x + self.y*self.y);
		
		//return darccos(self.x/len);
	}
	
	GetLength = function(){
		return sqrt(x*x + y*y);
	}
	
	static Normalize = function() // Makes the vector size 1
	{
		var len = sqrt(x*x + y*y);
		
		if(len!=0) // length is only 0 if both x and y is 0
		{
			x /= len;
			y /= len;
		}
	}

	/// @func					Rotate(angle);
	/// @param	{real}	angle	The angle to rotate vector in degrees
	static Rotate = function(angle)
	{
		var arr = [[dcos(angle),-dsin(angle)],[dsin(angle),dcos(angle)]];
		
		var rot_matrix = new Matrix2x2(arr);
		
		var rect = Multiply(rot_matrix, self);
		
		x = rect.x;
		y = rect.y;
	}
	
	///	@func					Scale(scalar)
	///	@param	{real}	scalar	The number to scale the vector by
	static Scale = function(scalar)
	{
		x *= scalar;
		y *= scalar;
	}
}